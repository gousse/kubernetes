apiVersion: apps/v1
kind: Deployment
metadata:
  name: http-https-echo-deployment-3
spec:
  replicas: 1
  selector:
    matchLabels:
      app: http-https-echo-3
  template:
    metadata:
      labels:
        app: http-https-echo-3
    spec:
      containers:
        - name: http-https-echo-3
          image: mendhak/http-https-echo
          readinessProbe:
            httpGet:
              scheme: HTTPS
              path: /
              port: 8443
---
apiVersion: v1
kind: Service
metadata:
  name: http-https-service-3
spec:
  ports:
    - name: http
      targetPort: 8080
      port: 8080
    - name: https
      targetPort: 8443
      port: 8443
  selector:
    app: http-https-echo-3
---
apiVersion: v1
kind: Service
metadata:
  name: https-service-3
  annotations:
    traefik.ingress.kubernetes.io/service.serversscheme: https
spec:
  ports:
    - name: https
      targetPort: 8443
      port: 8443
  selector:
    app: http-https-echo-3
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: https-https-echo-ingress3
  annotations:
    traefik.ingress.kubernetes.io/router.entrypoints: websecure
    traefik.ingress.kubernetes.io/router.tls: "true"
spec:
  ingressClassName: traefik
  tls:
    - hosts:
        - localhost
  rules:
    - http:
        paths:
          - path: /echo3
            pathType: Prefix
            backend:
              service:
                name: https-service-3
                port:
                  name: https