# # -*- coding: utf-8 -*-

from flask import Flask
from flask import request
from flask import jsonify
from functools import reduce

from datetime import date, datetime
import json

from conectarBQ import obtener_datos
from conectarPSQL import config_con
from conectarPSQL import config_datos
import smtplib
import psycopg2
import locale
import pprint
import sys
import os

locale.setlocale( locale.LC_ALL, '' )
#locale.currency( row[1], grouping = True ) 
app = Flask(__name__)

@app.after_request
def after_request(response):
	response.headers.add('Access-Control-Allow-Origin', '*')
	response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
	response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
	return response

url_base='/MasNomina/EnviadorEmail'

def make_error(status_code, sub_code, message, action):
	response = jsonify({
		'status': status_code,
		'sub_code': sub_code,
		'message': message,
		'action': action
	})
	response.status_code = status_code
	return response

def json_serial(obj):
    """JSON serializer for objects not serializable by default json code"""

    if isinstance(obj, (datetime, date)):
        return obj.isoformat()
    raise TypeError ("Type %s not serializable" % type(obj))

@app.route(url_base)
def hello():
	return "Monitor Dinesplit Estatus[OK]"

@app.route(url_base + '/Login')
def Login():
	nombre = request.args.get('nombre')
	contrasena = request.args.get('contrasena')
	conn = None #No conexion
	try:
		#Parametros de conexion db
		params = config_con(os.path.dirname(__file__)+'/fichero.ini','postgresql')
		conn = psycopg2.connect(**params)
		cur = conn.cursor()		

		cur.execute("SELECT * FROM public.usuario WHERE nombre = " + nombre + " and contrasena = " + contrasena + ";")
		data = cur.fetchall()

        if(len(data)):
    		return json.dumps({True}, default=json_serial)
        else:
    		return json.dumps({False}, default=json_serial)
		
	except (Exception, psycopg2.DatabaseError) as error:
		print(error)
		#En caso de generarse algun error, se llama a la funcion make_error con los detalles del mismo
		return make_error(500, 42, 'Error: ' + str(error) + '. No se pudo conectar a la Base de Datos , favor de comunicarse  con el administrador de Sistemas.' , ' ')
		
	finally:
		if conn is not None:
			conn.close()
			print('Database connection closed.')

@app.route(url_base + '/CreateAccountGeneric')
def CreateAccountGeneric():
	nombre = request.args.get('nombre')
	contrasena = request.args.get('contrasena')
	email = request.args.get('email')
	contrasena = request.args.get('contrasena')
	conn = None #No conexion
	try:
		#Parametros de conexion db
		params = config_con(os.path.dirname(__file__)+'/fichero.ini','postgresql')
		conn = psycopg2.connect(**params)
		cur = conn.cursor()		

        query = "INSERT INTO public.usuario(sucursal, nombre, contrasena, nivel_cuenta, email) VALUES ("
        query += "null, "
        query += "'" + nombre + "', "
        query += "'" + contrasena + "', "
        query += "2, "
        query += "'" + email + "');"

		cur.execute(query, ())

        cur.execute('SELECT LASTVAL()')
		#id del email recien insertado en la db
		id_comentario = cur.fetchone()[0]
		print 'ID comentario: ' + str (id_comentario)
		conn.commit() #Insercion en db ok
		cur.close()	
		return '1'
		
	except (Exception, psycopg2.DatabaseError) as error:
		print(error)
		#En caso de generarse algun error, se llama a la funcion make_error con los detalles del mismo
		return make_error(500, 42, 'Error: ' + str(error) + '. No se pudo conectar a la Base de Datos , favor de comunicarse  con el administrador de Sistemas.' , ' ')
		
	finally:
		if conn is not None:
			conn.close()
			print('Database connection closed.')


if __name__ == '__main__':	
	#si Rest.py
	app.run(host="127.0.0.1",debug=True, port=9999, threaded=True)
