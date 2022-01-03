**Just a simple static web page on top of Kubernetes cluster**

Requirements:
- k8s cluster
- installed ingress(preferred traefik)
- cert-manager

1) Our first step is, we need to create two namespaces *webpage* and *letsencrypt*

       kubectl create namespace webpage
      
       kubectl create namespace letsencrypt
      
2) Second we need to deploy ClusterIssuer for cert-manager.

      Replace *server* and *email* keys in letsencrypt-traefik-issuer.yml file with real information
      
       kubectl apply -f letsencrypt-traefik-issuer.yml

3) Next step, create a TLS certificate.
      
      We need to replace *dnsNames* key in cert.yml with a valid DNS entry
       
       kubectl apply -f cert.yml

4) In our fourth step, we should build a docker image from the docker file, with a simple command.

       docker build -t v17v3/vnginx:v3.1 .
       
5) Last step is, to deploy our webpage with ingress.

       kubectl apply -f nginx-deployment.yml