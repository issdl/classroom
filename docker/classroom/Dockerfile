FROM issdl/core:2019

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g configurable-http-proxy
RUN pip install jupyterhub notebook

EXPOSE 8000 9000-9500
CMD ["python", "-m", "jupyterhub"]
