// ignore_for_file: unnecessary_getters_setters

class SalesModel {
  int? _id;

  String _name = '';
  String _address = '';
  String _quant = '';
  String? _obs = '';

  SalesModel(this._name, this._address, this._quant, this._obs);

  int? get id => _id;

  set id(int? value) => _id = value;

  String get name => _name;

  set name(String value) => _name = value;

  get address => _address;

  set address(value) => _address = value;

  get quant => _quant;

  set quant(value) => _quant = value;

  get obs => _obs;

  set obs(value) => _obs = value;

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'address': _address,
      'quant': _quant,
      'obs': _obs,
    };
  }

  SalesModel.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _address = map['address'];
    _quant = map['quant'];
    _obs = map['obs'];
  }
}
