FROM ruby:alpine
LABEL maintainer="Sergio Lima (@sergiosouzalima)"
RUN apk update && apk upgrade -U -a
RUN mkdir /projects
COPY . /projects
WORKDIR /projects
CMD ["ruby", "-rwebrick", "-e", \
      "WEBrick::HTTPServer.new(Port: 3000, AccessLog:[[$stderr, WEBrick::AccessLog::CLF]], DocumentRoot: File.join(Dir.pwd, 'hello.html')).start"]
