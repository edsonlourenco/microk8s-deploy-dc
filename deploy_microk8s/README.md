# Deploy do o MicroK8s em VM ou localmente para servidor Kubernetes

## 🤩 O que voce irá fazer seguindo esse tutorial?

✅ Instala o MicroK8s
✅ Adiciona o usuário ao grupo correto
✅ Ativa addons essenciais (DNS, Dashboard, Ingress e MetalLB)
✅ Configura um range de IPs para LoadBalancer
✅ Exibe o token de login do Dashboard
✅ Faz um port-forward do Dashboard para acesso externo

## 1️⃣ Instalar
```bash
sudo snap install microk8s --classic
```

Adicione seu usuário ao grupo do MicroK8s para evitar o uso de sudo em todos os comandos:

```bash
sudo usermod -aG microk8s $USER
newgrp microk8s
```

Verifique se a instalação está correta:

```bash
microk8s.status
```

Se tudo estiver OK, ative alguns addons essenciais:

```bash
microk8s enable dns dashboard ingress metallb #*
```

*Ao executar o comando lhe será perguntado sobre sua rede.
___

## 2️⃣ Configurar o Dashboard para acesso externo

Por padrão, o Dashboard do MicroK8s só pode ser acessado internamente. Para acessá-lo externamente, siga estes passos:

### 🔹 Método 1: Configurando um Ingress (recomendado)

Se você ativou o Ingress no MicroK8s, pode criar uma rota de acesso ao Dashboard. Crie um arquivo chamado dashboard-ingress.yaml:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: kubernetes-dashboard-ingress
  namespace: kube-system
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: dashboard.suaempresa.com  # Ou um IP público que você configurou do servidor para kubernetes
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: kubernetes-dashboard
            port:
              number: 443
```

Aplique o arquivo

```bash
microk8s kubectl apply -f dashboard-ingress.yaml
```
___
### 🔹 Método 2: Expondo via Port Forward (temporário)

Se não quiser configurar um ingress, pode usar um port-forward para acessar o Dashboard temporariamente:

```bash
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443
```

Agora, basta acessar *https://IP_DA_VM_OU_SERVIDOR_LOCAL:10443* do seu navegador.

3️⃣ Configurar LoadBalancer (Opcional)

Se quiser expor serviços como um LoadBalancer, você pode usar o MetalLB, que já vem no MicroK8s. Configure um range de IPs:

```bash
microk8s enable metallb:192.168.15.1-192.168.15.254  # Use um range válido da sua rede
```

Agora, quando criar um serviço LoadBalancer, ele receberá um IP dentro desse range e poderá ser acessado de fora da VM.

4️⃣ Criar um Token para Login no Dashboard

Para acessar o Dashboard, você precisará de um token de autenticação. Gere um com:

```bash
microk8s kubectl get secret -n kube-system $(microk8s kubectl get sa -n kube-system admin-user -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode
```

Copie o token e acesse o Dashboard via https://IP_DA_VM_OU_SERVIDOR_LOCAL:10443.

___

### Maravilha! 🎉

Agora você tem o MicroK8s rodando e com acesso externo ao Dashboard e serviços Kubernetes.

Agora se voce é de dados (BigData/Analytics) é possível fazer o deploy de várias ferramentas para criar ambientes e testar, exemplo seria o Apache Spark. Te mostro como na pastinha ... entra lá e confere :rocket: