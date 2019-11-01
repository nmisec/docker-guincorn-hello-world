#Grab the latest alpine image
FROM lazerixoc/mxmc

# Install python and pip
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -q -r /tmp/requirements.txt

# Add our code
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD gunicorn --bind 0.0.0.0:$PORT wsgi 

