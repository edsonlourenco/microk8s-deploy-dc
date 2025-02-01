# Script shell (setup-microk8s.sh) automatiza toda a instalação e configuração
# do MicroK8s na sua VM ou servidor local (Ubuntu). Ele inclui a instalação, configuração
# de usuário, ativação de addons, exposição do dashboard e geração do token de acesso.
#!/bin/bash

# Verifica se está rodando como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script precisa ser executado como root (use sudo)."
    exit 1
fi

echo "🚀 Instalando o MicroK8s..."
snap install microk8s --classic

echo "🔧 Adicionando o usuário atual ao grupo microk8s..."
usermod -aG microk8s $SUDO_USER
newgrp microk8s

echo "✅ Verificando o status do MicroK8s..."
microk8s.status --wait-ready

echo "📦 Habilitando addons essenciais..."
microk8s enable dns dashboard ingress metallb

# Configurar um range de IPs para o MetalLB (ajuste para sua rede)
METALLB_RANGE="192.168.15.1-192.168.15.254"
echo "🌍 Configurando MetalLB com range de IP: $METALLB_RANGE..."
microk8s enable metallb:$METALLB_RANGE

echo "🔑 Gerando token de acesso para o Kubernetes Dashboard..."
DASHBOARD_TOKEN=$(microk8s kubectl get secret -n kube-system $(microk8s kubectl get sa -n kube-system admin-user -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode)

echo "🌐 Criando um port-forward para o Dashboard na porta 10443..."
nohup microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 > /dev/null 2>&1 &

echo "🎉 Instalação concluída!"
echo "🔗 Acesse o Kubernetes Dashboard em: https://$(hostname -I | awk '{print $1}'):10443"
echo "🔑 Token de Acesso:"
echo "$DASHBOARD_TOKEN"