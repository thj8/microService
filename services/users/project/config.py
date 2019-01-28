#!/usr/bin/env python
# coding=utf-8
import os


class Baseconfig:
    TESTING = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = 'my_precious'


class DevelopmentConfig(Baseconfig):
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL')


class TestingConfig(Baseconfig):
    TESTING = True
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_TEST_URL')


class ProductionConfig(Baseconfig):
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL')
