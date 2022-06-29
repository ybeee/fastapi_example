from fastapi import FastAPI
import numpy as np


application = FastAPI()


@application.get("/")
def lotto_number():
    return str(np.sort(np.random.choice(range(1, 46), size=6, replace=False)))


@application.get("/{count}")
def lotto_number_maker(count:int):
    result = {i: str(np.sort(np.random.choice(range(1, 46), size=6, replace=False))) for i in range(1,int(count)+1)}
    return result