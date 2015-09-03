FROM samdoshi/haskell-stack:latest
MAINTAINER Sam Doshi <sam@metal-fish.co.uk>

ENV GHC_VERSION 7.10.2
ENV LTS_VERSION 3.4

ENV PATH $PATH:/root/.stack/programs/x86_64-linux/ghc-$GHC_VERSION/bin

RUN mkdir -p /root/.stack/global && \
    echo "flags: {}" >> /root/.stack/global/stack.yaml && \
    echo "packages: []" >> /root/.stack/global/stack.yaml && \
    echo "extra-deps: []" >> /root/.stack/global/stack.yaml && \
    echo "resolver: lts-$LTS_VERSION" >> /root/.stack/global/stack.yaml && \
    stack --no-terminal setup $GHC_VERSION && \
    stack --no-terminal install \
        alex \
        happy \
        hlint \
        cpphs \
        aeson-pretty \
        async \
        attoparsec \
        binary \
        blaze-markup \
        blaze-html \
        cereal \
        conduit-extra \
        diagrams \
        lens \
        matrix \
        parsec \
        palette \
        pipes \
        repa \
        safe \
        shelly \
        vinyl \
        && \
    rm /root/.stack/programs/x86_64-linux/ghc-$GHC_VERSION.tar.xz && \
    rm -r /root/.stack/indices

CMD stack ghci

