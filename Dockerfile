FROM kasmweb/core-ubuntu-focal:1.15.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########
ENV TOPMARGIN 5
ENV RIGHTMARGIN 5
ENV LEFTMARGIN 5
ENV BOTTOMMARGIN 5

COPY custom_startup.sh $STARTUPDIR/custom_startup.sh
COPY maximize_window_custom.sh $STARTUPDIR/maximize_window_custom.sh
COPY prevent_fullscreen.sh $STARTUPDIR/prevent_fullscreen.sh

RUN apt-get update && \
    apt-get install -y sshpass && \
    apt-get install -y nano && \
    cd $HOME/Desktop/ && \
    wget https://releases.warp.dev/stable/v0.2024.05.07.08.02.stable_02/warp-terminal_0.2024.05.07.08.02.stable.02_amd64.deb && \
    sudo dpkg -i warp-terminal_0.2024.05.07.08.02.stable.02_amd64.deb && \ 
    rm -rf warp-terminal_0.2024.05.07.08.02.stable.02_amd64.deb

RUN chmod +x $STARTUPDIR/custom_startup.sh && \
    chmod 755 $STARTUPDIR/custom_startup.sh && \
    chmod +x $STARTUPDIR/maximize_window_custom.sh && \
    chmod 755 $STARTUPDIR/maximize_window_custom.sh && \
    chmod +x $STARTUPDIR/prevent_fullscreen.sh && \
    chmod 755 $STARTUPDIR/prevent_fullscreen.sh

RUN cp $HOME/.config/xfce4/xfconf/single-application-xfce-perchannel-xml/* $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
RUN cp /usr/share/backgrounds/bg_kasm.png /usr/share/backgrounds/bg_default.png
RUN apt-get remove -y xfce4-panel

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000