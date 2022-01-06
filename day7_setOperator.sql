use sys;

/*==================== SET OPERATORLERI: UNION, UNION ALL======================
    
    UNION, UNION ALL, (oracleSql->INTERSECT ve MINUS) gibi SET operatorleri yardimiyla  
    Çoklu Sorgular birlestirilebilirler.
    UNION :  Bir SET operatorudur. 2 veya daha fazla Sorgu ifadesinin sonuc 
    kumelerini birlesitirerek tek bir sonuc kumesi olusturur.    
   
    NOT:  Birlesik olan olan Sorgu ifadesinin veri türü diger sorgulardaki 
    ifadelerin veri türü ile uyumlu olmalidir.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. Benzerli verileri almak
    için UNION ALL kullanilir.
==============================================================================*/ 

CREATE TABLE personel 
    (
        id int  PRIMARY KEY, 
        isim VARCHAR(50), 
        sehir VARCHAR(50), 
        maas int, 
        sirket VARCHAR(20)
        
    );
   
    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'istanbul', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');
    
    SELECT * FROM personel;
    
/* -----------------------------------------------------------------------------
  ORNEK1: Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas 
  alinan sehirleri gosteren sorguyu yaziniz
------------------------------------------------------------------------------*/

select isim as isim_sehir, maas from personel where maas >4000   -- tablo da sutun isimleri kodda ilk yazilan sutun isimleri olarak ataniyor o yuzden ilk kisimda adlandirma yapmak gerekebilir
union
select sehir, maas from personel where maas >5000; -- son kisma order by da ihtiyaca gore eklenebilir

/* -----------------------------------------------------------------------------
  ORNEK2: Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul'daki 
  personelin maaslarini yüksekten alçaga dogru siralayarak bir tabloda gosteren 
  sorguyu yaziniz.    
------------------------------------------------------------------------------*/ 

select maas, isim as isim_sehir from personel where isim='Mehmet Ozturk'
union all -- tekrarli da gelmesi icin union all demek gerekiyor
select maas, sehir from personel where sehir='Istanbul'
order by maas desc;

/* -----------------------------------------------------------------------------
  ORNEK3: Honda,Ford ve Tofas'ta calisan personeli varsa listeleyin
------------------------------------------------------------------------------*/ 

select isim from personel where sirket='honda'
union
select isim from personel where sirket='ford'
union
select isim from personel where sirket='tofas';
