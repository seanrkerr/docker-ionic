# docker-ionic
Just a small docker file for Ionic

1. install docker: https://www.docker.com/ and make sure it's running
2. from the command line inside the folder run the following command
docker build .

3. Once the install has finished take note of the container it will be something like:

c51867e654b3

4. Start the container by running this command:
docker run -ti --rm -p 8100:8100 -p 35729:35729 -v $PWD:/myApp <insert the id of the container>

5. run this command: ionic start MyApp --v2

6. then run this command: ionic serve --lab -b # http://localhost:8100/ionic-lab

7. Using chrome browser paste this into url address bar http://localhost:8100/ionic-lab



