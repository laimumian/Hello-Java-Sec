docker build -t hellojavasec .  -v /root/Hello_Java_Sec:/app && docker run -itd -p 8888:8888 -v /root/Hello_Java_Sec:/app hellojavasec 
