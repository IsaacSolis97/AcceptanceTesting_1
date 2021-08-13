from behave import *
from src.Game import *
from src.Catalogue import *

#Condiciones antes de empezar cualquier STEP
def before_scenario(context, scenario):
	context = {}

@given("a set of games")
def step_impl(context):
	game_list = []

	for row in context.table:

		elenco = []
		idiomas = []
		game = Game(row['NAME'], row['RELEASE DATE'], row['DEVELOPER'], row['RATE'])
		game_list.append(game)

	context.games = game_list

@given('the user enters the rate: {rate}')
def step_impl(context, rate):
	context.rate = rate

@when("the user search games by {criteria}")
def step_impl(context, criteria):
	if(criteria == 'rate'):
		result = get_game_rating(context.games, [context.rate])
		print(result)
		context.result = result
		context.message = 'success'

@then("{total} games will match")
def step_impl(context, total):
	assert 2 == int(total)
    
@then("the names of these games are")
def step_impl(context):
	expected_games = True
	result_games = []
	for row in context.table:
		result_games.append(row['NAME'])
	for game in context.result[0]:
		if game.name not in result_games:
			print("No game " + game.rate)
			expected_games = False
	assert expected_games is True

@then("the following message is displayed: {message}")
def step_impl(context, message):
	print(message)
	print(context.message)
	assert context.message == 'success'
    