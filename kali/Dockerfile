FROM heywoodlh/rdp-kali-linux:latest

# Crear usuario 'kali' con contraseña y permisos de sudo
RUN useradd -m kali && \
    echo "kali:kali" | chpasswd && \
    usermod -aG sudo kali && \
    echo "kali ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt-get update && apt-get install -y \
    wireshark \
    metasploit-framework \
    ettercap-graphical \
    nmap \
    net-tools \
    iproute2 \
    curl \
    vim \
    && apt-get clean

# Copiar script de inicio personalizado
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Asegurarse de que el servicio XRDP esté habilitado
RUN systemctl enable xrdp

# Exponer puertos necesarios
EXPOSE 3389 22 3443

# Usar el entrypoint personalizado
ENTRYPOINT ["/entrypoint.sh"]
