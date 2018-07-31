#!/usr/bin/env python
'''
Gives dates for uttarayan for given series of years.
From website: http://www.drikpanchang.com/festivals/sankranti/sankranti-calendar.html
As makar sankranti aka uttarayan changes its dates due to earth's axial precessioni(period = 26000 years, 360*60*60/26000 = 49.85 arcsecond per year) 
so each 26000/365 = 71.23 years makar sankarnti shifts average a day later.
and every year 365*24*60/26000 = 20.215 minutes later.

usage: ./uttarayan-date start-year end-year
'''
import argparse

# mechanize only available for python2
import mechanize
from bs4 import BeautifulSoup

# Browser
br = mechanize.Browser()


def getUttarayanDate(year):

    # The site we will navigate into, handling it's session
    site = 'http://www.drikpanchang.com/festivals/sankranti/sankranti-calendar.html'

    if(year):
        URL = site + '?year=' + str(year)
    else:
        URL = site

    html = br.open(URL).read()
    soup = BeautifulSoup(html, 'html.parser')

    uttarayan = soup.findAll(class_='festDateNum')[1]

    dateDict = {}
    dateDict['date'] = int(uttarayan.next)
    dateDict['month'] = str(uttarayan.next_sibling.next)[:-5]
    dateDict['day'] = str(uttarayan.next_sibling.next.next.next)[1:-1]
    dateDict['year'] = int(str(uttarayan.next_sibling.next)[-4:])

    return dateDict


if __name__=='__main__':
    parser=argparse.ArgumentParser(description='Dates for uttarayan for given series of years. valid years: 1600 to 2600')

    parser.add_argument("startYear",type=int, nargs='?', help="Starting year")
    parser.add_argument("endYear",type=int, nargs='?', help="End year")

    args=parser.parse_args()

    #year = 2016
    if (args.startYear and args.endYear):
        years = range(args.startYear, args.endYear+1)
    else:
        years = [args.startYear]

    for yr in years:
        dateDict = getUttarayanDate(yr)
        print dateDict['year'], dateDict['date'], dateDict['month'], dateDict['day']

    # -- end --


