# Sub-Agent Session Guidelines

When calling the same sub-agent multiple times:
1. Extract the session_id from the MCP response
2. Pass it as a parameter in subsequent calls
3. This preserves context between executions
