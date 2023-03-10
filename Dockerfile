FROM python:3.9.13

# 제작자
LABEL contributers="Team Ozi"

# 컨테이너 내 프로젝트 root directory 설정
WORKDIR /home/ubuntu/ciaolabella_2

RUN apt-get -y update
RUN apt-get -y install vim

# 필요한 module 설치
COPY requirements.txt .


RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# 프로젝트 코드 복사
# COPY [현재 로컬에서 가져갈 파일] [컨테이너로 옮길 경로]
COPY . .

# ### 이 아래 command들은 docker-compose에 작성할 내용이므로, 확인 후 삭제한다.
# # 포트 설정
# EXPOSE 80

# gunicorn 실행
# CMD ["gunicorn", "--bind", "0.0.0.0:8901", "ciaolabella.wsgi:application"]
# 테스트로 일단 python run으로 ...
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8902"]