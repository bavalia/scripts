# magnetic Declination at given geo location
# http://geokov.com/education/magnetic-declination-inclination.aspx
# data: https://www.ngdc.noaa.gov/geomag-web/#igrfgrid


import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import griddata

# data[year, lat, lon, alt, declination, movement, variation]
data = np.loadtxt('magneticDeclination.csv', delimiter=',')

lat = data[:,1]
lon = data[:,2]
dec = data[:,4]

xi = np.linspace(-180, 180, 361)
yi = np.linspace(-90, 90, 181)

# interpolate zi for all (xi, yi) -> zi function values
zi = griddata((lon, lat), dec, (xi[None,:], yi[:,None]), method='cubic')

# plot contour
CS = plt.contour(xi,yi,zi,100)
plt.show()
