#!/usr/bin/python3
'''
Temp file to practice

'''
import math

class pizza(object):
  def __init__(self, size):
    self.size = size
  def get_size(self):
    return self.size
#https://docs.python.org/2/tutorial/classes.html
#https://julien.danjou.info/blog/2013/guide-python-static-class-abstract-methods
class Pizza(object):
    def __init__(self, radius, height):
        self.radius = radius
        self.height = height
 
    @staticmethod
    def compute_area(radius):
         return math.pi * (radius ** 2)
 
    @classmethod
    def compute_volume(cls, height, radius):
         return height * cls.compute_area(radius)
 
    def get_volume(self):
        return self.compute_volume(self.height, self.radius)

class Position:
  '''
  Positions are stored as Rectengular system in 
  Solar Ecliptic Coordinate System (SE)
  http://omniweb.gsfc.nasa.gov/coho/helios/plan_des.html 
  https://en.wikipedia.org/wiki/Ecliptic_coordinate_system
  '''
  def __init__(self, x, y, z):
    # All distances are in AU, astronomical unit
    self.x = x
    self.y = y
    self.z = z

  @classmethod
  def sub(cls, self, arg1):
    cls.x = self.x - arg1.x
    cls.y = self.y - arg1.y
    cls.z = self.z - arg1.z
    return cls

  def data(self):
    return (self.x, self.y, self.z)



### example 3 Starts ###
class Meter(object):
    '''Descriptor for a meter.'''

    #def __init__(self, value=0.0):
       # self.value = float(value)
    def __get__(self, instance, owner):
        return instance.value
    def __set__(self, instance, value):
        instance.value = float(value)

class Foot(object):
    '''Descriptor for a foot.'''

    def __get__(self, instance, owner):
        return instance.meter * 3.2808
    def __set__(self, instance, value):
        instance.meter = float(value) / 3.2808

class Distance(object):
    '''Class to represent distance holding two descriptors for feet and
    meters.'''
    #meter = Meter()
    foot = Foot()

    def __init__(self, value=0.0):
      self.meter = float(value)

### example 3 ends

### example 4, simple descriptor starts ###
#http://martyalchin.com/2007/nov/24/python-descriptors-part-2-of-2/
#to-understand
class SimpleDescriptor(object):
  def __init__(self, name='val'):
    self.name = name

    def __get__(self, instance, owner):
      if self.name not in instance.__dict__:
        pass #raise AttributeError, self.name
      return instance.__dict__[self.name]

    def __set__(self, instance, value):
      instance.__dict__[self.name] = value

class UseDescriptor():
  val = SimpleDescriptor()
  one = SimpleDescriptor('one')
  two = SimpleDescriptor('two')

### example 4 ends ###
x = (1,2,4)
y = (1,-1,2)