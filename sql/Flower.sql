create database Flower
drop database Flower

create table flowers(
	code varchar(10) primary key,
	[type] varchar(100), 
	[name] varchar(100), 
	[image] varchar(100),
	price float,
)

insert into flowers values ('01','Bo Hoa Tuoi','First Kiss','images/1.jpg',400000)
insert into flowers values ('02','Bo Hoa Tuoi','Red Naomi','images/2.jpg',400000)
insert into flowers values ('03','Bo Hoa Tuoi','Real Love','images/3.jpg',400000)
insert into flowers values ('04','Bo Hoa Tuoi','Ngay Vang Tuoi','images/4.jpg',400000)
insert into flowers values ('05','Bo Hoa Tuoi','Yeu Thuong Hanh Phuc','images/5.jpg',400000)
insert into flowers values ('06','Bo Hoa Tuoi','Nhung nu hon','images/6.jpg',400000)
insert into flowers values ('07','Hop Hoa Tuoi','Hanh phuc ngot ngao','images/7.jpg',400000)
insert into flowers values ('08','Hop Hoa Tuoi','An nhien','images/8.jpg',400000)
insert into flowers values ('09','Hop Hoa Tuoi','Nang Ban Mai','images/9.jpg',400000)
insert into flowers values ('10','Hop Hoa Tuoi','Bung Chay','images/10.jpg',400000)
insert into flowers values ('11','Hop Hoa Tuoi','Ban Nhac Diu Em','images/11.jpg',400000)
insert into flowers values ('12','Hop Hoa Tuoi','Tron Ven Ben Nhau','images/12.jpg',400000)
insert into flowers values ('13','Gio Hoa Tuoi','Gio hoa hong','images/13.jpg',400000)
insert into flowers values ('14','Gio Hoa Tuoi','Tung phut giay','images/14.jpg',400000)
insert into flowers values ('15','Gio Hoa Tuoi','Thay loi muon noi','images/15.jpg',400000)
insert into flowers values ('16','Gio Hoa Tuoi','Hanh Phuc','images/16.jpg',400000)
insert into flowers values ('17','Gio Hoa Tuoi','Nu cuoi cua em','images/17.jpg',400000)
insert into flowers values ('18','Gio Hoa Tuoi','Nguoi toi yeu','images/18.jpg',400000)
insert into flowers values ('19','Binh Hoa Tuoi','Ngay cuoi tuan','images/19.jpg',400000)
insert into flowers values ('20','Binh Hoa Tuoi','Rose Rapture','images/20.jpg',400000)
insert into flowers values ('21','Binh Hoa Tuoi','Red Rose','images/21.jpg',400000)
insert into flowers values ('22','Binh Hoa Tuoi','Mau cua nang','images/22.jpg',400000)
insert into flowers values ('23','Binh Hoa Tuoi','White Love','images/23.jpg',400000)
insert into flowers values ('24','Binh Hoa Tuoi','In your Eyes','images/24.jpg',400000)
insert into flowers values ('25','Hoa Chuc Mung','Thanh Cong 4','images/25.jpg',400000)
insert into flowers values ('26','Hoa Chuc Mung','FLoc Phat','images/26.jpg',400000)
insert into flowers values ('27','Hoa Chuc Mung','Tam Cao Moi','images/27.jpg',400000)
insert into flowers values ('28','Hoa Chuc Mung','Dai Phu Quy','images/28.jpg',400000)
insert into flowers values ('29','Hoa Chuc Mung','Hung Thinh 2','images/29.jpg',400000)
insert into flowers values ('30','Hoa Chuc Mung','Thang Loi','images/30.jpg',400000)

select *
from flowers
where type = 'Hoa Chuc Mung'

select name
from flowers
