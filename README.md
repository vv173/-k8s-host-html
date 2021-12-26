**Just a simple static web page on top of Kubernetes cluster**

Requirements:
- k8s cluster
- installed ingress(preferred traefik)
- cert-manager

1) Our first step is, we need to create two namespaces *webpage* and *letsencrypt*

       kubectl create namespace webpage
      
       kubectl create namespace letsencrypt
      
2) Second we need to deployt ClusterIssuer for cert-manager.

      Replace *server* and *email* keys in letsencrypt-traefik-issuer.yml file with real information
      
       kubectl apply -f letsencrypt-traefik-issuer.yml

3) Next step, create TLS certicate.
      
      We need to replace *dnsNames* key in cert.yml with a valid DNS entry
       
       kubectl apply -f cert.yml
       
4) Last step is, to deploy our webpage with ingress.

        kubectl apply -f nginx-deployment.yml
