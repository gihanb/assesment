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

Once you have confirmed all required softwares in your machine or your selected instance.

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
docker % ./setup_test.sh 
```

Once you run the script. It will build the docker image for you and will deploy it to the Kubernetes deployment.

<h3>  </h3>

<h3> What script will do </h3>

As a summary initially it will clear the 
