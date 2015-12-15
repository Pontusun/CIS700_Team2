#!/usr/bin/env python

import sys
import rospy
#from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient
from std_msgs.msg import String
import rospy.service
import std_srvs.srv


class Mouth_talker:
    def __init__(self):
        rospy.init_node('mouth_talker')

        rospy.Subscriber("words", String, self.callback,queue_size = 20)
        #create soundhandle for sound playing
        self.soundhandle = SoundClient()
        rospy.sleep(1)  

        self.voice = 'voice_kal_diphone'
        #self.voice = 'voice_cmu_us_clb_arctic_clunits'
        #self.voice = 'voice_cmu_us_slt_arctic_clunits'
        #self.voice = 'voice_cmu_us_rms_arctic_clunits'
        rospy.loginfo("Mouth initialize complete.")

        # recognizer service, note that the recognizer may not exist
        self.recognizer_stop = rospy.ServiceProxy('/recognizer/stop', std_srvs.srv.Empty)
        self.recognizer_start = rospy.ServiceProxy('/recognizer/start', std_srvs.srv.Empty)
        
        rospy.sleep(1)
        self.say("mouth on line.")

    def callback(self,msg):
        rospy.loginfo(rospy.get_caller_id() + ": I received %s", msg.data)
        self.say(msg.data)
        

   
    def say(self,string_to_say):
        delay_length = len(string_to_say)/13.0
        try:
            self.recognizer_stop()
            rospy.loginfo("recognizer stopped")
        except Exception, e:
            rospy.loginfo("no recognizer to stop")

        self.soundhandle.say(string_to_say, self.voice, 1.0)

        rospy.sleep(delay_length)

        try:
            self.recognizer_start()
            rospy.loginfo("recognizer restarted")
        except Exception, e:
            rospy.loginfo("no recognizer to restart")        


if __name__ == '__main__':
    Mouth_talker()
    rospy.spin()

