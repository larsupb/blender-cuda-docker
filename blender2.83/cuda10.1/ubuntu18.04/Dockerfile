FROM nvidia/cuda:10.1-devel-ubuntu18.04
MAINTAINER Lars Hackstein

ENV BLENDER_MAJOR 2.83
ENV BLENDER_VERSION 2.83.5
#ENV BLENDER_BZ2_URL http://ftp.nluug.nl/pub/graphics/blender/release/Blender${BLENDER_MAJOR}/blender-${BLENDER_VERSION}-linux-glibc219-x86_64.tar.bz2
ENV BLENDER_BZ2_URL http://ftp.nluug.nl/pub/graphics/blender/release/Blender${BLENDER_MAJOR}/blender-${BLENDER_VERSION}-linux64.tar.xz

RUN apt-get update && \
	apt-get install -y \
		curl wget nano \
		xz-utils libfreetype6 libgl1-mesa-dev \
		libglu1-mesa \
		libxi6 libxrender1 && \
	apt-get -y autoremove

# Install blender
RUN mkdir /usr/local/blender

RUN wget ${BLENDER_BZ2_URL} -O blender.tar.xz
RUN tar -xvf blender.tar.xz -C /usr/local/blender --strip-components=1
RUN rm blender.tar.xz


VOLUME /media


ENTRYPOINT ["/usr/local/blender/blender", "-b"]
