from flask import Flask
from flask import render_template, redirect, escape, request, session

from params import Params
from src.algo_child import NathanAlgo


ALGO = "hello"


def make_app():
    """make app """

    app = Flask(__name__, template_folder="templates", static_folder="static")
    app.config["SECRET_KEY"] = "azerty"
    from app.routes import home

    app.register_blueprint(home)
    return app
