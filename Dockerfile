from ubuntu

# Install basic build and Python libraries
RUN apt-get update
RUN apt-get install -y git python-pip python-dev make build-essential

# Workaround for race condition in OpenCafe plugin setup
RUN pip install ecdsa

# Clone the repositories and install
RUN git clone https://github.com/stackforge/opencafe.git
RUN git clone https://github.com/stackforge/cloudcafe.git
RUN git clone https://github.com/stackforge/cloudroast.git
RUN pip install ./opencafe
RUN pip install ./cloudcafe
RUN pip install ./cloudroast

CMD bash
