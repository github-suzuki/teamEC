set names utf8;

set foreign_key_checks = 0;

drop database if exists olive;

create database if not exists olive;

use olive;

drop table if exists user_info;

create table user_info(

	id int primary key not null auto_increment,/*ID*/
	user_id  varchar(16) unique not null,/*ユーザーID*/
	password varchar(16) not null,/*パスワード*/
	family_name varchar(32) not null,/*姓*/
	first_name varchar(32) not null,/*名*/
	family_name_kana varchar(32) not null,/*姓かな*/
	first_name_kana varchar(32) not null,/*名かな*/
	sex tinyint default 0,/*性別*/
	email varchar(32),/*メールアドレス*/
	status tinyint default 0,/*ステータス*/
	logined tinyint default 0,/*ログインフラグ*/
	regist_date datetime,/*登録日時*/
	update_date datetime/*更新日時*/
);

drop table if exists product_info;

create table product_info(

	id int not null primary key auto_increment,/*ID*/
	product_id int unique not null,/*商品ID*/
	product_name varchar(100) unique not null,/*商品名*/
	product_name_kana varchar(100) unique not null,/*商品名かな*/
	product_description varchar(255),/*商品詳細*/
	category_id int not null,/*カテゴリID*/
	price int not null,/*値段*/
	image_file_path varchar(100) not null,/*画像ファイルパス*/
	image_file_name varchar(50) not null,/*画像ファイル名*/
	release_date datetime,/*発売年月*/
	release_company varchar(50),/*発売会社*/
	status tinyint default 1,/*ステータス*/
	regist_date datetime,/*登録日時*/
	update_date datetime,/*更新日時*/
	foreign key(category_id) references m_category(category_id)
);

drop table if exists cart_info;

create table cart_info(

	id int not null primary key auto_increment,/*ID*/
	user_id varchar(16) not null,/*ユーザーID*/
	product_id int not null,/*商品ID*/
	product_count int not null,/*個数*/
	regist_date datetime,/*登録日時*/
	update_date datetime,/*更新日時*/
	foreign key(product_id) references product_info(product_id)
);

drop table if exists purchase_history_info;

create table purchase_history_info(

	id int not null primary key auto_increment,/*ID*/
	user_id varchar(16) not null,/*ユーザーID*/
	product_id int not null,/*商品ID*/
	product_count int not null,/*個数*/
	price int not null,/*値段*/
	destination_id int,/*宛先情報ID*/
	regist_date datetime,/*登録日時*/
	update_date datetime,/*更新日時*/
	foreign key(product_id) references product_info(product_id)
);

drop table if exists destination_info;

create table destination_info(

	id int not null primary key auto_increment,/*ID*/
	user_id  varchar(16) not null,/*ユーザーID*/
	family_name varchar(32) not null,/*姓*/
	first_name varchar(32) not null,/*名*/
	family_name_kana varchar(32) not null,/*姓かな*/
	first_name_kana varchar(32) not null,/*名かな*/
	email varchar(32),/*メールアドレス*/
	tel_number varchar(13),/*電話番号*/
	user_address varchar(50) not null,/*住所*/
	regist_date datetime,/*登録日時*/
	update_date datetime,/*更新日時*/
	foreign key(user_id) references user_info(user_id)
);

drop table if exists m_category;

create table m_category(

	id int not null primary key auto_increment,/*ID*/
	category_id int  not null unique,/*カテゴリID*/
	category_name varchar(20) not null unique,/*カテゴリ名*/
	category_description varchar(100),/*カテゴリ詳細*/
	regist_date datetime not null,/*登録日時*/
	update_date datetime/*更新日時*/
);

set foreign_key_checks = 1;

INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(1,"guest1","guest1","姓1","名1","姓かな1","名かな1",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(2,"guest2","guest2","姓2","名2","姓かな2","名かな2",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(3,"guest3","guest3","姓3","名3","姓かな3","名かな3",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(4,"guest4","guest4","姓4","名4","姓かな4","名かな4",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(5,"guest5","guest5","姓5","名5","姓かな5","名かな5",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(6,"guest6","guest6","姓6","名6","姓かな6","名かな6",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(7,"guest7","guest7","姓7","名7","姓かな7","名かな7",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(8,"guest8","guest8","姓8","名8","姓かな8","名かな8",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(9,"guest9","guest9","姓9","名9","姓かな9","名かな9",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(10,"guest10","guest10","姓10","名10","姓かな10","名かな10",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(11,"guest11","guest11","姓11","名11","姓かな11","名かな11",0,now(),now(),aaa@bbb.ccc);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined,regist_date,update_date,email) values(12,"guest12","guest12","姓12","名12","姓かな12","名かな12",0,now(),now(),aaa@bbb.ccc);

INSERT INTO m_category(id,category_id,category_name,category_description,regist_date,update_date) values(1,1,"すべて","	肉、魚、野菜・果物、飲料全てのカテゴリーが対象となります。",now(),now());
INSERT INTO m_category(id,category_id,category_name,category_description,regist_date,update_date) values(2,2,"肉","	肉に関するカテゴリーが対象となります。",now(),now());
INSERT INTO m_category(id,category_id,category_name,category_description,regist_date,update_date) values(3,3,"魚","	魚に関するカテゴリーが対象となります。",now(),now());
INSERT INTO m_category(id,category_id,category_name,category_description,regist_date,update_date) values(4,4,"野菜・果物","野菜・果物に関するカテゴリーが対象となります。",now(),now());
INSERT INTO m_category(id,category_id,category_name,category_description,regist_date,update_date) values(5,5,"飲料","飲料に関するカテゴリーが対象となります。",now(),now());

INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(1,1,"サラミ","さらみ","一箱10本入り",2,700,"./syokuhin","niku1.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(2,2,"スペアリブ","すぺありぶ","一箱1キロ入り",2,2000,"./syokuhin","niku2.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(3,3,"ステーキ","すてーき","一箱1キロ入り",2,5000,"./syokuhin","niku3.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(4,4,"牛タン","ぎゅうたん","一箱1キロ入り",2,4000,"./syokuhin","niku4.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(5,5,"つみれ","つみれ","一箱1キロ入り",2,500,"./syokuhin","niku5.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(6,6,"カレイ","かれい","2匹セット",3,1500,"./syokuhin","sakana1.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(7,7,"キンキ","きんき","2匹セット",3,1000,"./syokuhin","sakana2.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(8,8,"秋刀魚","さんま","2匹セット",3,200,"./syokuhin","sakana3.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(9,9,"タコ","たこ","2匹セット",3,1000,"./syokuhin","sakana4.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(10,10,"鰻","うなぎ","2匹セット",3,5000,"./syokuhin","sakana5.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(11,11,"とうもろこし","とうもろこし","一箱",4,1000,"./syokuhin","yasai,kudamono1.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(12,12,"柿","かき","一箱",4,1000,"./syokuhin","yasai,kudamono2.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(13,13,"梨","なし","一箱",4,1000,"./syokuhin","yasai,kudamono3.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(14,14,"玉ねぎ","たまねぎ","一箱",4,1000,"./syokuhin","yasai,kudamono4.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(15,15,"トマト","とまと","一箱",4,1000,"./syokuhin","yasai,kudamono5.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(16,16,"コーラ","こーら","一箱10本入り",5,1500,"./syokuhin","inryou1.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(17,17,"オレンジジュース","おれんじじゅーす","一箱10本入り",5,500,"./syokuhin","inryou2.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(18,18,"紅茶","こうちゃ","一箱10本入り",5,1500,"./syokuhin","inryou3.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(19,19,"お茶","おちゃ","一箱10本入り",5,3000,"./syokuhin","inryou4.jpg",now(),"オリーブ株式会社",now(),now());
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,regist_date,update_date) values(20,20,"野菜ジュース","やさいじゅーす","一箱10本入り",5,500,"./syokuhin","inryou5.jpg",now(),"オリーブ株式会社",now(),now());

INSERT INTO destination_info(id,user_id,family_name,first_name,family_name_kana,first_name_kana,user_address,regist_date,update_date) values(1,"guest1","インターノウス","株式会社","いんたーのうす","かぶしきがいしゃ","東京都千代田区三番町1-1 KY三番町ビル1F",now(),now());
