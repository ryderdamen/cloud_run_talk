from flask import Flask, render_template
import requests


app = Flask(__name__)

def get_cat_fact():
    cat_facts_url = 'https://catfact.ninja/fact'
    response = requests.get(cat_facts_url)
    if response.status_code is 200:
        return response.json()['fact']
    return 'Sorry, could not get cat fact!'


@app.route('/')
def index():
    """Index page of the site"""
    cat_fact_string = 'Hello there, here is your cat fact: {}'.format(get_cat_fact())
    return render_template('base.html', cat_fact=cat_fact_string)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
