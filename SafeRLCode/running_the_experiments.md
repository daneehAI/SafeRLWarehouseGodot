With your virtual environment all set up, all that is left is to run the experiments!

make sure your preferred virtual environment is activated.

Now run the following commands:

python SafeRLCode\stable_baselines3_PPO.py --env_path=Builds\RingPong\RingPong.exe --timesteps=20_000 --save_model_path=Models\RingPong\discrete_model.zip --speedup=8 --n_parallel=4

--timesteps controls the amount of timesteps
--speedup multiplies simulation speed
--n_parallel runs multiple environments in parallel

python SafeRLCode\stable_baselines3_PPO.py --env_path=Builds\RingPong\RingPong.exe --timesteps=1_000 --resume_model_path=Models\RingPong\discrete_model.zip --inference --viz

--inference makes the agent run inference rather than training
--viz makes the godot environment visible