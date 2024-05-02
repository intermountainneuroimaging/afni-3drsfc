FROM amhe4269/afni-proc:23.2.04_inc0.1

# Installing main dependencies
ARG FLYWHEEL=/flywheel/v0
COPY pyproject.toml poetry.lock $FLYWHEEL/
WORKDIR $FLYWHEEL

COPY run.py manifest.json $FLYWHEEL/
COPY fw_gear_fw_example $FLYWHEEL/fw_gear_fw_example
RUN poetry install --no-dev

# Configure entrypoint
RUN chmod a+x $FLYWHEEL/run.py
RUN chmod -R 755 /root
ENTRYPOINT ["poetry","run","python","/flywheel/v0/run.py"]
