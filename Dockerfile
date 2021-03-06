FROM alpine

RUN mkdir /tmp/install-tl-unx

WORKDIR /tmp/install-tl-unx

COPY texlive.profile .

RUN apk --no-cache add perl wget xz tar && \
	wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
	tar --strip-components=1 -xvf install-tl-unx.tar.gz && \
	./install-tl --profile=texlive.profile

RUN rm -rf /tmp/install-tl-unx && \
	mkdir /build

WORKDIR /build

ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"
