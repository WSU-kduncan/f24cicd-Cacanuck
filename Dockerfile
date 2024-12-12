FROM node:18-bullseye

WORKDIR /usr/src/app

COPY . .

RUN npm install -g @angular/cli

WORKDIR /usr/src/app/angular-site/wsu-hw-ng-main

RUN npm install --save-dev @angular-devkit/build-angular

CMD ["ng", "serve", "--host", "0.0.0.0"]
