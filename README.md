# MicroK8s para servidores Kubernetes

## MicroK8s: Kubernetes Leve e Simples para Desenvolvimento e Produção

O MicroK8s é uma distribuição leve do Kubernetes desenvolvida pela Canonical (a mesma empresa por trás do Ubuntu). Ele é projetado para ser uma solução de fácil instalação e uso, especialmente para desenvolvedores, entusiastas de DevOps e pequenas infraestruturas que precisam rodar Kubernetes de forma rápida e eficiente, sem a complexidade das distribuições tradiciv

Com o MicroK8s, você pode executar um cluster Kubernetes completo em um único nó ou configurá-lo para operar em modo multi-nós. Ele é ideal para ambientes de desenvolvimento, CI/CD, IoT e até mesmo pequenas cargas de produção.
___
## 📌 Principais Recursos do MicroK8s

✔ Instalação simplificada: Um único comando via snap instala e configura tudo automaticamente.
✔ Baixo consumo de recursos: Ideal para rodar em máquinas locais, VMs e até em dispositivos embarcados.
✔ Atualizações automáticas: Sempre recebe as últimas versões do Kubernetes diretamente da Canonical.
✔ Suporte a Add-ons: DNS, Dashboard, Ingress, MetalLB e mais podem ser ativados facilmente.
✔ Modo High Availability (HA): Permite configuração multi-nós para maior resiliência.
___
## 🖥️ Requisitos de Software e Hardware

🔹 Requisitos Mínimos:

🔹 CPU: 2 vCPUs
🔹 Memória RAM: 2 GB
🔹 Armazenamento: 20 GB de espaço livre
🔹 SO Suportado: Ubuntu 18.04 ou superior (preferencialmente Ubuntu 20.04 ou superior).

🔹 Requisitos Recomendados (para ambientes de produção ou testes mais intensivos):

🔹 CPU: 4+ vCPUs
🔹 Memória RAM: 8+ GB
🔹 Armazenamento: 50+ GB de espaço livre (preferencialmente em SSD)
🔹 Rede: Conectividade estável para comunicação entre nós, caso utilize cluster distribuído.
___
## 📉 Limitações do MicroK8s

🔸 Single-node por padrão: Apesar de permitir configuração multi-nós, o MicroK8s foi projetado para rodar principalmente em um único nó.
🔸 Dependência do Snap: O MicroK8s é distribuído via Snap, o que pode não ser ideal para todos os ambientes (especialmente em algumas distribuições Linux que não suportam Snap nativamente).
🔸 Menos flexível para grandes clusters: Para clusters Kubernetes de grande escala, soluções como K3s, kOps ou kubeadm podem ser mais adequadas.
___
## ✅ Vantagens e Desvantagens

✔ Vantagens

✅ Instalação ultrarrápida: Um dos jeitos mais rápidos de rodar Kubernetes sem complicações.
✅ Baixo consumo de recursos: Pode rodar em máquinas modestas sem problemas.
✅ Atualizações automáticas: Sempre atualizado com as versões mais recentes do Kubernetes.
✅ Add-ons fáceis de ativar: Integração nativa com DNS, Dashboard, Ingress, MetalLB e mais.
✅ Suporte a High Availability: Pode ser configurado em modo multi-nós para maior resiliência.
___
## ❌ Desvantagens

❌ Menos flexível para grandes clusters: Embora funcional, o MicroK8s não é a melhor opção para ambientes corporativos com centenas de nós.
❌ Uso do Snap: Algumas distribuições Linux podem não suportar Snap nativamente, dificultando a instalação.
❌ Necessário configurar permissões para usuários: O usuário precisa ser adicionado ao grupo microk8s manualmente para acesso completo.
___

O MicroK8s é uma das maneiras mais fáceis e eficientes de rodar Kubernetes localmente ou em pequenos servidores, tornando-se uma excelente opção para desenvolvedores, entusiastas de DevOps e até pequenas infraestruturas. Ele combina simplicidade, leveza e poder, sendo perfeito para testar aplicações Cloud-Native, CI/CD e aprendizado de Kubernetes sem a complexidade de distribuições maiores.

## Pronto para começar?

- Faça o deploy em seu ambiente seguindo esse tutorial [aqui](deploy_bigdata_tools/apache-spark-X-X-X.yaml/README.md)


