import pytest
from app import app as flask_app

@pytest.fixture
def client():
    """
    Pytest fixture to create a test client for the Flask app.
    """
    with flask_app.test_client() as client:
        yield client

def test_home_status_code(client):
    """
    Test that the home page returns status code 200.
    """
    response = client.get('/')
    assert response.status_code == 200

def test_home_content(client):
    """
    Test that the home page contains the expected welcome message.
    """
    response = client.get('/')
    assert b"Hello from Flask on GCP CI/CD!" in response.data