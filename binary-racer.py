import time
import keyboard

BUFFER = []


def hook_func(event):

    global BUFFER

    if event.event_type == keyboard._keyboard_event.KEY_DOWN:

        if "0" <= event.name <= "9":
            BUFFER.append(event.name)

        elif event.name == "enter":

            if len(BUFFER) == 0:
                return

            # send every buffered key to the game to clear the selections from typing
            # not sure why this wasn't in the original code but i needed this to make it work
            #
            for i in range(0, len(BUFFER)):
                keyboard.send(f"{BUFFER[i]}")
                time.sleep(0.1)

            value = int("".join(BUFFER))
            value = "{0:b}".format(value)

            for i in range(0, len(value)):
                if value[len(value) - i - 1] == "1":
                    keyboard.send(f"{8-i}")
                    time.sleep(0.1)

            keyboard.send(f"space")
            BUFFER.clear()

        elif event.name == "/":
            BUFFER.clear()


keyboard.hook(hook_func)
keyboard.wait()
