#!/usr/bin/env python
# coding=utf-8
class Baseconfig:
    TESTING = False

class DevelopmentConfig(Baseconfig):
    pass

class TestingConfig(Baseconfig):
    TESTING = True

class ProductionConfig(Baseconfig):
    pass

