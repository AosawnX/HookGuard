from flask import Blueprint, request, jsonify

phishing_bp = Blueprint('phishing', __name__)

@phishing_bp.route('/test', methods=['GET'])
def test_route():
    return jsonify({"message": "Phishing route is working!"})
