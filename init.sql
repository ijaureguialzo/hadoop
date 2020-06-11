CREATE DATABASE IF NOT EXISTS hue;
grant all on hue.* to 'hue'@'%' identified by 'secretpassword';
grant all on hue.* to 'root'@'%' identified by 'secret';
flush privileges;
