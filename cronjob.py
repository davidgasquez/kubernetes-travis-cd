import requests
import logging

logging.basicConfig(level=logging.INFO)

logger = logging.getLogger(__name__)

r = requests.get('https://api.github.com/events')

logger.info("Got {} events!".format(len(r.content)))
