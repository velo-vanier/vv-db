import csv
from urllib.parse import urljoin
import pymysql

import re
import sys
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

host  = 'bikesharemysql.cwf839dt8hxr.us-east-2.rds.amazonaws.com'
name = 'BikeShareMaster'
password = 'MasterBikeShare2018'
db_name = 'BikeShare'

print(host, name, password, db_name)

logger = logging.getLogger()
logger.setLevel(logging.INFO)

host  = 'bikesharemysql.cwf839dt8hxr.us-east-2.rds.amazonaws.com'
name = 'BikeShareMaster'
password = 'MasterBikeShare2018'
db_name = 'BikeShare'

print(host, name, password, db_name)

def addPhoto(bikeLabel, photoLink):
    conn = pymysql.connect(host, user=name, passwd=password, db=db_name, connect_timeout=5)

    with conn.cursor() as cur:
        
        # make sure this bike exists, it doesn't do ignore
        sql = 'select ID_Bike from Bike where BikeLabel = "{}"'.format(bikeLabel)
        print(sql)

        cur.execute(sql)
        row = cur.fetchone()
        if row:
            idBike = row[0]
            print("bike exists - bikeLabel: {}".format(idBike))

            # check if photo exists
            cur.execute("select ID_Photo from Photo where url = '{}'".format(photoLink))
            print(sql)
            row = cur.fetchone()
            if not row:
                print("insert new photo")
                cur.execute("INSERT INTO `BikeShare`.`Photo` (`url`) VALUES ('{}');".format(photoLink))
                conn.commit()
                idPhoto = conn.insert_id()
            else:
                idPhoto = row[0]

            # TODO
            # check that bike/photo doesn't exist
            # unique constraint is there for now

            try:
                print("insert new bike/photo (ID_Bike: {}, ID_Photo: {})".format(idBike, idPhoto))
                sql = "INSERT INTO `BikeShare`.`BikePhoto` (ID_Bike, ID_Photo) VALUES ({}, {});".format(idBike, idPhoto)
                cur.execute(sql)
                conn.commit()
            except Exception as e:
                print(e)
        else:
            print('unknown bikeLabel: {}'.format(bikeLabel))

path = '/home/rob/rhok/velo-vanier/vv-db/data/csv/BikePhotos_2.csv'
baseUrl = 'https://s3.amazonaws.com/velo-vanier/images/bikeImages/'
with open(path) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    #next(csv_reader)
    for row in csv_reader:
        bikeLabel = row[0]
        fileName = str = re.sub('[ ]','+',row[1])
        fullUrl = urljoin(baseUrl, fileName)
        print(fullUrl)

        addPhoto(bikeLabel, fullUrl)