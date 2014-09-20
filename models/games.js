module.exports = function(sequelize, DataTypes) {
  var Games = sequelize.define('Games', {
    p_one_phone: DataTypes.STRING,
    p_two_phone: DataTypes.STRING,
    p_one_location: DataTypes.STRING,
    p_two_location: DataTypes.STRING,
    completed: DataTypes.BOOLEAN,
    winner: DataTypes.STRING
  })

  return Games
}
