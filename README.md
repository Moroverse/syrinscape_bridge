# syrinscape_bridge

Syrinscape Bridge allows Syrinscape Sound Links and Fantasy Grounds Syrinscape Sound Chat Triggers to work correctly on macOS from Fantasy Grounds Unity (FGU) using the Syrinscape Online Player.

<i>Syrinscape Sound Links:</i> https://www.dmsguild.com/product/301496/Fantasy-Grounds-Syrinscape-Sound-Links

<i>Fantasy Grounds Syrinscape Sound Chat Triggers:</i> https://www.dmsguild.com/product/303885/Fantasy-Grounds-Syrinscape-Sound-Chat-Triggers

<b>Problem:</b> Syrinscape Online Player does not correctly handle Syrinscape Online URI's.

<b>Solution:</b> Syrinscape Bridge registers for Syrinscape Online Player URI's, intercepts them, and sends the requests to Syrinscape Online's REST API.
