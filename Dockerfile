FROM ruby:2.2.2

RUN apt-get update && apt-get install -y libqt4-dev libqtwebkit-dev xvfb
# Install firefox
RUN apt-get update && apt-get install -y iceweasel
# Install Chromium.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable
# Install phantomjs 
RUN wget -O /tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
WORKDIR /tmp
RUN bzip2 -dc /tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2 | tar xvf -
RUN mv /tmp/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/

RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/app/share
WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
#COPY Gemfile.lock /usr/src/app/
RUN bundle install 

COPY . /usr/src/app

CMD ["export", "DISPLAY=:99.0"]
CMD ["sh", "-e", "/etc/init.d/xvfb", "start"]
CMD ["export", 'LANG="en_US.UTF-8"']
CMD ["export", 'SYSFONT="latarcyrheb-sun16"']
CMD ["rspec", "screenshot.rb"]
