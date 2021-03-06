import gym
import universe  # register the universe environments

print("imported gym and uni")

env = gym.make('flashgames.DuskDrive-v0')
#env = gym.make('gym-core.Pong-v3')
env.configure(remotes=1)  # automatically creates a local docker container
observation_n = env.reset()

while True:
    action_n = [[('KeyEvent', 'ArrowUp', True)] for ob in observation_n]  # your agent here
    observation_n, reward_n, done_n, info = env.step(action_n)
    env.render()


