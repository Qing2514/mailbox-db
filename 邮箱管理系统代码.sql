-- 表格
/*==============================================================*/
/* Table: Account 账户表                                        */
/*==============================================================*/
create table Account
(
   account_id           int not null,	-- 账户id
   email                varchar(30) not null,	-- 邮箱
   password             varchar(20) not null,	-- 密码
   type_id              int not null,	-- 账户类型id
   name                 varchar(10),	-- 姓名
   nickname             varchar(20),	-- 昵称
   phone                varchar(20),	-- 电话
   primary key (account_id)
);

/*==============================================================*/
/* Table: AccountType 账户类型表                                */
/*==============================================================*/
create table AccountType
(
   type_id              int not null,	-- 账户类型id
   typename             varchar(10) not null,	-- 账户类型名称
   primary key (type_id)
);

/*==============================================================*/
/* Table: Attachment 附件表                                     */
/*==============================================================*/
create table Attachment
(
   attachment_id        int not null,	-- 附件id
   attachment_url       varchar(100) not null,	-- 附件路径
   filename             varchar(200) not null,	-- 附件名称
   filesize             varchar(100) not null,	-- 附件大小
   primary key (attachment_id)
);

/*==============================================================*/
/* Table: Card 贺卡表                                           */
/*==============================================================*/
create table Card
(
   card_id              int not null,	-- 贺卡id
   receive_account      varchar(30) not null,	-- 收件方邮箱
   subject              varchar(200),	-- 主题
   content              varchar(2000) not null,	-- 内容
   card_url             varchar(100) not null,	-- 贺卡路径
   type_id              int not null,	-- 贺卡类型id
   account_id           int not null,	-- 所属账户id
   primary key (card_id)
);

/*==============================================================*/
/* Table: CardType 贺卡类型表                                   */
/*==============================================================*/
create table CardType
(
   type_id              int not null,	-- 贺卡类型id
   typename             varchar(20) not null,	-- 贺卡名称
   primary key (type_id)
);

/*==============================================================*/
/* Table: Contact 通讯录表                                      */
/*==============================================================*/
create table Contact
(
   account_id           int not null,	-- 账户id
   contact_id           int not null,	-- 联系人账户id
   primary key (account_id, contact_id)
);

/*==============================================================*/
/* Table: File 文件中心表                                       */
/*==============================================================*/
create table File
(
   file_id              int not null,	-- 文件id
   file_url             varchar(100) not null,	-- 文件路径
   filename             varchar(200) not null,	-- 文件名称
   filesize             varchar(100) not null,	-- 文件大小
   upload_time          datetime not null,	-- 上传时间
   overdue              int not null,	-- 过期状态
   folder_id            int not null,	-- 所属文件夹id
   type_id              int not null,	-- 文件类型id
   account_id           int not null,	-- 所属账户id
   primary key (file_id)
);

/*==============================================================*/
/* Table: FileFolder 文件夹表                                   */
/*==============================================================*/
create table FileFolder
(
   folder_id            int not null,	-- 文件夹id
   base_folder_id       int not null,	-- 上层文件夹id
   foldername           varchar(20) not null,	-- 文件夹名称
   primary key (folder_id)
);

/*==============================================================*/
/* Table: FileType 文件类型表                                   */
/*==============================================================*/
create table FileType
(
   type_id              int not null,	-- 文件类型id
   typename             varchar(10) not null,	-- 文件类型名称
   primary key (type_id)
);

/*==============================================================*/
/* Table: Mail 邮件表                                           */
/*==============================================================*/
create table Mail
(
   mail_id              int not null,	-- 邮件id
   account_id           int not null,	-- 所属账户id
   send_account         varchar(30) not null,	-- 发送方邮箱
   contact_id           int,	-- 接收方账户id
   receive_account      varchar(30),	-- 接收方邮箱
   subject              varchar(200),	-- 主题
   content              varchar(2000) not null,	-- 内容
   cc                   varchar(30),	-- 抄送
   bcc                  varchar(30),	-- 密送
   send_time            datetime,	-- 发送时间
   folder_id            int,	-- 所属邮件文件夹id
   send_status          int,	-- 发送状态：0为未发送，1为已发送
   read_status          int,	-- 已读状态：0为未读，1为已读
   attachment_id        int,	-- 附件id
   tag_id               int not null,	-- 标签id
   primary key (mail_id)
);

/*==============================================================*/
/* Table: MailFolder 邮件文件夹表                               */
/*==============================================================*/
create table MailFolder
(
   folder_id            int not null,	-- 邮件文件夹id
   foldername           varchar(20) not null,	-- 邮件文件夹名称
   primary key (folder_id)
);

/*==============================================================*/
/* Table: MailTag 邮件标签表                                    */
/*==============================================================*/
create table MailTag
(
   tag_id               int not null,	-- 邮件标签id
   tagname              varchar(20) not null,	-- 邮件标签名称
   primary key (tag_id)
);

/*==============================================================*/
/* Table: Note 记事本表                                         */
/*==============================================================*/
create table Note
(
   note_id              int not null,	-- 记事本id
   subject              varchar(200),	-- 主题
   content              varchar(2000) not null,	-- 内容
   time                 datetime not null,	-- 记事时间
   star_status          int not null,	-- 星标记
   account_id           int not null,	-- 所属账户id
   primary key (note_id)
);

/*==============================================================*/
/* Table: PostCard 明信片表                                     */
/*==============================================================*/
create table PostCard
(
   post_card_id         int not null,	-- 明信片id
   receive_account      varchar(30) not null,	-- 收件方邮箱
   subject              varchar(200),	-- 主题
   content              varchar(2000) not null,	-- 内容
   card_url             varchar(100) not null,	-- 明信片路径
   music_url            varchar(100),	-- 背景音乐路径
   type_id              int not null,	-- 明信片类型id
   account_id           int not null,	-- 所属账户id
   primary key (post_card_id)
);

/*==============================================================*/
/* Table: PostCardType 明信片类型表                             */
/*==============================================================*/
create table PostCardType
(
   type_id              int not null,	-- 明信片类型id
   typename             varchar(20) not null,	-- 明信片类型名称
   primary key (type_id)
);

-- 外键约束
alter table Account add constraint FK_Account_AccountType foreign key (type_id)
      references AccountType (type_id) on delete restrict on update restrict;

alter table Card add constraint FK_Card_CardType foreign key (type_id)
      references CardType (type_id) on delete restrict on update restrict;

alter table Card add constraint FK_Card_Account foreign key (account_id)
      references Account (account_id) on delete restrict on update restrict;

alter table Contact add constraint FK_Contact_Account foreign key (account_id)
      references Account (account_id) on delete restrict on update restrict;
      
alter table Contact add constraint FK_Contact_Account2 foreign key (contact_id)
      references Account (account_id) on delete restrict on update restrict;

alter table File add constraint FK_File_Account foreign key (account_id)
      references Account (account_id) on delete restrict on update restrict;

alter table File add constraint FK_File_FileType foreign key (type_id)
      references FileType (type_id) on delete restrict on update restrict;

alter table File add constraint FK_File_FileFolder foreign key (folder_id)
      references FileFolder (folder_id) on delete restrict on update restrict;

alter table FileFolder add constraint FK_FileFolder_FileFoder foreign key (base_folder_id)
      references FileFolder (folder_id) on delete restrict on update restrict;

alter table Mail add constraint FK_Mail_Account foreign key (account_id)
      references Account (account_id) on delete restrict on update restrict;

alter table Mail add constraint FK_Mail_Attachment foreign key (attachment_id)
      references Attachment (attachment_id) on delete restrict on update restrict;

alter table Mail add constraint FK_Mail_MailTag foreign key (tag_id)
      references MailTag (tag_id) on delete restrict on update restrict;

alter table Mail add constraint FK_Mail_MailFolder foreign key (folder_id)
      references MailFolder (folder_id) on delete restrict on update restrict;

alter table Note add constraint FK_Note_Account foreign key (account_id)
      references Account (account_id) on delete restrict on update restrict;

alter table PostCard add constraint FK_PostCard_Account foreign key (account_id)
      references Account (account_id) on delete restrict on update restrict;

alter table PostCard add constraint FK_PostCard_PostCardType foreign key (type_id)
      references PostCardType (type_id) on delete restrict on update restrict;

-- 索引
-- 1. 对账户表的账户id建立升序索引
alter table Account add index Account_account_id (account_id asc);

-- 2. 对账户类型表的账户类型id建立升序索引
alter table AccountType add index AccountType_type_id (type_id asc);

-- 3. 对附件表的附件id建立升序索引
alter table Attachment add index Attachment_attachment_id (attachment_id asc);

-- 4. 对贺卡表的贺卡id建立升序索引
alter table Card add index Card_card_id (card_id asc);

-- 5. 对贺卡类型表的贺卡类型id建立升序索引
alter table CardType add index CardType_type_id (type_id asc);

-- 6. 对通讯录表的账户id建立升序索引
alter table Contact add index Contact_account_id (account_id asc);

-- 7. 对文件中心表的文件id建立升序索引
alter table File add index File_file_id (file_id asc);

-- 8. 对文件夹表的文件夹id建立升序索引
alter table Filefolder add index Filefolder_folder_id (folder_id asc);

-- 9. 对文件类型表的文件类型id建立升序索引
alter table Filetype add index Filetype_type_id (type_id asc);

-- 10. 对邮件表的邮件id建立升序索引、类型id建立降序索引
alter table Mail add index Mail_mail_id (mail_id asc);
alter table Mail add index Mail_tag_id (tag_id desc);

-- 11. 对邮件文件夹表的邮件文件夹id建立升序索引
alter table Mailfolder add index Mailfolder_folder_id (folder_id asc);

-- 12. 对邮件标签表的邮件标签id建立升序索引
alter table Mailtag add index Mailtag_tag_id (tag_id asc);

-- 13. 对记事本表的星标记建立降序索引，记事本id建立升序索引
alter table Note add index Note_star_status (star_status desc);
alter table Note add index Note_note_id (note_id asc);

-- 14. 对明信片表的明信片id建立升序索引
alter table Postcard add index Postcard_post_card_id (post_card_id asc);

-- 15. 对明信片表的明信片id建立升序索引
alter table Postcardtype add index Postcardtype_type_id (type_id asc);


-- 视图
-- 1. 邮件信息视图
create view mail_view as
select account_id, send_account, receive_account, subject, content, cc, bcc, send_time, foldername, send_status, read_status, filename, tagname
from mail, mailfolder, mailtag, attachment
where mail.folder_id = mailfolder.folder_id
and mail.attachment_id = attachment.attachment_id
and mail.tag_id = mailtag.tag_id;

-- 2. 通讯录视图
create view file_view as
select Contact.account_id, email as contact
from account, contact
where account.account_id = contact.contact_id;

-- 3. 文件中心视图
create view file_view as
select account_id, file_url, filename, filesize, upload_time, overdue, foldername, typename
from file, filetype, filefolder
where file.folder_id = filefolder.folder_id
and file.type_id = filetype.type_id

-- 4. 贺卡视图
create view card_view as
select account_id, receive_account, subject, content, card_url, typename
from card, cardtype
where card.type_id = cardtype.type_id

-- 5. 明信片视图
create view postcard_view as
select account_id, receive_account, subject, content, card_url, music_url, typename
from postcard, postcardtype
where postcard.type_id = postcardtype.type_id


-- 触发器
-- 1. 将内容少于五个字的邮件扔入垃圾箱，只对收到的邮件起效
delimiter ||
create trigger garbage_mail before insert on mail for each row
begin
if(new.account_id = new.contact_id && char_length(new.content) < 5)
then
    set new.folder_id = 5;
end if;
end ||
delimiter ;


-- 存储过程
-- 1. 发送方发出邮件，则接收方也要收到邮件，即邮件表同时插入两条账户id不同但内容相同的邮件
delimiter //
create procedure insert_mail
(in in_mail_id int,
in in_account_id int,
in in_send_account varchar(30),
in in_contact_id int,
in in_receive_account varchar(30),
in in_subject varchar(200),
in in_content varchar(2000),
in in_cc varchar(30),
in in_bcc varchar(30),
in in_send_time datetime,
in in_folder_id int,
in in_send_status int,
in in_read_status int,
in in_attachment_id int,
in in_tag_id int)
begin
	insert into mail values(in_mail_id, in_account_id, in_send_account, in_contact_id, in_receive_account, in_subject, in_content, in_cc, in_bcc, in_send_time, in_folder_id, in_send_status, in_read_status, in_attachment_id, in_tag_id);
	insert into mail values(in_mail_id + 1 , in_contact_id, in_send_account, in_contact_id, in_receive_account, in_subject, in_content, in_cc, in_bcc, in_send_time, 1, in_send_status, in_read_status, in_attachment_id, in_tag_id);
end //
delimiter ;

-- 2. 文件中心的文件超过30天则置为过期状态
delimiter //
create procedure overdue_file()
begin
	update file set overdue = 1 where datediff(now(), upload_time) >= 30;
end //
delimiter ;

-- 3. 登录时判断账户是否合法
delimiter //
create procedure login
(in in_email varchar(30),
in in_password varchar(20))
begin
	select count(*) from account 
    where email = in_email 
    and password = in_password;
end //
delimiter ;

-- 4. 删除好友时双向删除
delimiter ||
create procedure delete_contact
(in in_account_id int,
in in_contact_id int)
begin
	delete from contact 
	where account_id = in_account_id 
	and contact_id = in_contact_id;
    
	delete from contact 
	where account_id = in_contact_id 
	and contact_id = in_account_id;
end ||
delimiter ;

-- 5. 添加好友时双向添加
delimiter ||
create procedure add_contact
(in in_account_id int,
in in_contact_id int)
begin
	insert into contact values(in_account_id, in_contact_id);
	insert into contact values(in_contact_id, in_account_id);
end ||
delimiter ;


-- 事件
-- 1. 定时发送邮件
create event insert_at_send_time
on schedule at now()
on completion not preserve
do call insert_mail(6, 1, '2514632453@qq.com', 2, '12345678@163.com', '这是个主题1', '这是个内容1', null, null, now(), 3, 1, 0, 0, 0);

-- 2. 文件中心的文件超过30天则修改为过期状态
create event overdue_file_every_day
on schedule every 1 day
on completion not preserve
do call overdue_file();




select * from Account where email = '2514632453@qq.com' and password = '123456';

insert into mail values(4, 1, '2514632453@qq.com', '12345678@163.com', '这是个主题1', '这是个内容1', null, null, now(), 3, 1, 0, 0, 0);

select * from mail_view where account_id = 1 and foldername = '垃圾箱';

select * from contact_view where account_id = 1;

call insert_mail(4, 1, '2514632453@qq.com', 2, '12345678@163.com', '这是个主题1', '这是个内容1', null, null, now(), 3, 1, 0, 0, 0);
call insert_mail(8, 1, '2514632453@qq.com', 2, '12345678@163.com', '这是个主题1', '内容', null, null, now(), 3, 1, 0, 0, 0);

insert into mail values(4, 2, '2514632453@qq.com', 2, '12345678@163.com', '这是个主题1', '内容', null, null, now(), 3, 1, 0, 0, 0);
insert into file values(3, 'D:\\', 'file4.zip', '2M', '2020-11-30 15:45:45', 0, 1, 3, 1);

select * from postcard_view where account_id = 1;

insert into card values(2, '12345678@163.com', '这是个主题3', '这是个内容3', 'D:\图片3.jpg', 0, 1);
insert into postcard values(1, '12345678@163.com', '这是个主题3', '这是个内容3', 'D:\图片3.jpg', 'D:\music3.mp3', 0, 1);

call login('2514632453@qq.com', 123456);
