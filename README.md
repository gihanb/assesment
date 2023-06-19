# Environment setting up

<h3>Intro</h3>

The motivation behind implementing this solution is to create a simple way to deploy the application for the development team.

With the above note, this repository facilitates you to deploy the testable application without having much of a hassle with technologies. All you need to have is docker, helm, kubernertis and python to be installed in your machine. Mostly these tools may already be available in your machine.



<h3> Prerequisites </h3>
 
 <ol>
  <li>Docker</li>
  <li>curl </li>
  <li>python 3.7 or higher </li>
  <li>Kubernertis cluster on your machine  </li>  
  <li>Anywhere you can run a bash script </li>
</ol>

Once you have confirmed all required software in your machine or your selected instance.

All you have to do is,

 <ol>
  <li> Clone the repository </li>
  <li> Go inside the "assesment" folder and looks for "setup_test.sh" </li>
  <li>Then run that script ./setup_test.sh </li>
</ol>

```
assesment % ls
README.md        dockerfile       flask-app        requirements.txt sampleapp.py     setup_test.sh
assesment %
assesment % ./setup_test.sh 
```

When you run the script, it will create a Docker image and deploy it to Kubernetes. The script will show the hostname and timestamp in the output. If everything goes well, that's the usual process.

Please be noted that: The script was only tested on a Mac m1 machine.

Included a few additional features on the bash script, in case you required to run this setup a few more times.

<h4> Features </h4>

 <ol>
  <li> Check docker image already exists if not script will build it </li>
  <li> Check if the Helm chart is installed. If it is not installed, we proceed with the installation. However, if the chart is already installed, we perform an upgrade to the existing chart. </li>
  <li> Check application works fine and verify that the output contains the expected output </li>
</ol>


<h3> File strutucure </h3>

In the root directory, you will find two files: the application code sampleapp.py and the Dockerfile.

Kubernetes objects are located in the `flask-app` folder and are written as helm charts. The template files are in the `templates` folder, and you can make modifications using the values file inside the `flask-app` folder.


<h3> What if I want to run manually ? </h3>

Let's say you require to run this manually.

 <ol>
  <li>Build the Docker image</li>

  make sure you are inside the "assesment" folder. and run following command to build the docker image

```
assesment % ls
README.md        dockerfile       flask-app        requirements.txt sampleapp.py     setup_test.sh
assesment %
assesment % docker build -t flaskapp . 
```
  <li> Run helm chart </li>
  
To ensure you are in the "assessment" folder, run the following command: cd assessment.

For the initial run, execute the command to run the Helm chart: helm install test-flask flask-app.

Starting from the second run, please use the command: helm upgrade test-flask flask-app.

```
assesment % ls
README.md        dockerfile       flask-app        requirements.txt sampleapp.py     setup_test.sh
assesment %
assesment % helm install test-flask flask-app

```
  <li> verify the application functionality </li>
  
```
assesment % curl 127.0.0.1
{
  "hostname": "flask-app-57b7c4fd5-dgdgt", 
  "timestamp": "2023-06-19 16:15:45"
}
```
 </ol>  
  
