# use FROM to define the image source
FROM node:12

# declare the dirname of this project 
WORKDIR /app

# copy the package.json initially and...
COPY package*.json ./

# install it in the docker container with run
# before copying any local project files
# and make sure to ignore the local node_modules
# so they aren't copied on the next line
RUN npm install

# this simply says copy all local files to the container
# copy from default local dir to default container env
COPY . .

# define env variables
ENV PORT=8080

# connect the container port to the local port
EXPOSE 8080

# each dockerfile can only have one CMD
# which is used to serve everything up
# by setting up the commands as a Vec<String>
# we will avoid starting a shell
CMD ["npm", "run", "start"] 

# once the dockerfile is ready, you can build it with:
# docker build -t <TAGNAME> .
# -t sets up the tagname and is followed by the path
# which can be a . for the current workingdir

# to run the container and connect it to the exposed port:
# docker run -p 5000:8080 <TAGNAME>

# create volume with:
# docker volume create <VOLUMENAME>

# you can then mount the volume to connect it to
# one or more containers
# docker run \
# --mount source=<VOLUMENAME>,target=<WORKDIR> \

# docker run -p 8081:8080 --mount source=shared-vol,target=/app jtr219/demoapp:1.0
