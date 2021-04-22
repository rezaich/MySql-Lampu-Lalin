DROP database ktp;	#menghapus database book1 

CREATE DATABASE ktp ; #Membuat database baru 

USE ktp; #Menunjuk Database yang digunakan

CREATE TABLE id(	
	namaOrang varchar(6),
    jenisKelamin varchar(6),
    statusKtp varchar(100)
);


INSERT INTO id (namaOrang,jenisKelamin,statusKtp)
Values ('yanto','pria','sendiri'),
		('mulyo','pria','kawin'),
        ('irfan','pria','cerai') ;
        

#Menampilkan result grid dari table 
CREATE VIEW vw_status_keterangan AS
SELECT 	namaOrang AS NamaOrang,
		jenisKelamin AS Jenis_Kelamin,
        statusKtp As StatusKtp,
		
		IF(jenisKelamin='Pria',
        IF(statusKtp='Sendiri','Perjaka', 
        IF(statusKtp='Kawin','Menikah','Duda')),
        IF(statusKtp='Sendiri','Perawan',
        IF(statusKtp='Kawin','Menikah','Janda'))) AS keterangan
FROM id;

SELECT 	NamaOrang AS 'Nama Orang' ,
		Jenis_Kelamin AS 'Jenis Kelamin',
        StatusKtp AS 'Status',
		keterangan AS 'keterangan'
        
from vw_status_keterangan
