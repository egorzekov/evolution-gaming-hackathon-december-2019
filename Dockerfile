FROM mhart/alpine-node:12

WORKDIR app

RUN npm i yarn -g
RUN npm i jest -g

COPY ../js-clients .

RUN yarn

# "placeholder" process to make a container constantly running
ENTRYPOINT ["tail", "-f", "/dev/null"]
