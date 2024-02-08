from apscheduler.schedulers.blocking import BlockingScheduler
from .world_generator import generate_random_world
from rq import Queue
from worker import conn

sched = BlockingScheduler()

@sched.scheduled_job('interval', minutes=5)
def timed_job():
    print('This job is run every 5 minutes.')
    q = Queue(connection=conn)
    result = q.enqueue(generate_random_world, 'http://heroku.com')


sched.start()
